import ast
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent
FILES_JS = ROOT_DIR / 'demo' / 'files.js'
PNG_DIR = ROOT_DIR / 'PNG'
ICO_DIR = ROOT_DIR / 'ICO'
SIZES = ('16', '24', '32', '48', '256')
MAGICK = None

def read_file_list(path):
  text = path.read_text(encoding='utf-8')
  match = re.search(r'const\s+files\s*=\s*(\[.*?\])\s*;', text, re.S)
  if match is None:
    raise RuntimeError(f'Could not find file list in {path}')
  values = ast.literal_eval(match.group(1))
  names = []
  for value in values:
    name = str(value).strip()
    if name:
      names.append(name)
  return names

def find_magick():
  for command in ('magick', 'convert'):
    resolved = shutil.which(command)
    if resolved:
      return resolved
  raise RuntimeError('ImageMagick was not found in PATH.')

def generate_icon(icon_name):
  png_paths = [PNG_DIR / f'{icon_name}_{size}.png' for size in SIZES]
  missing = [str(path) for path in png_paths if not path.exists()]
  if missing:
    raise FileNotFoundError(f'Missing PNG sources for {icon_name}: {missing}')
  output_path = ICO_DIR / f'{icon_name}.ico'
  command = [MAGICK, 'convert', *[str(path) for path in png_paths], str(output_path)]
  subprocess.run(command, check=True)
  print(f'Generated {output_path.name}')

def prompt_for_name(valid_names):
  name = input('Enter the name for the file to generate (leave blank to generate them all): ').strip("'\"")
  if not name:
    return None

  if name not in valid_names:
    raise ValueError(f'Unknown file name: {name}')

  return [name]

def main():
  valid_names = read_file_list(FILES_JS)
  targets = prompt_for_name(valid_names)

  if not targets:
    targets = valid_names

  for name in targets:
    generate_icon(name)

if __name__ == '__main__':
  try:
    MAGICK = find_magick()

    main()
  except Exception as ex:
    print(f'\nUnhandled error: {ex}')

  input('\nPress Enter to exit...')
