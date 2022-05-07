const resolutions = [256, 48, 32, 24, 16];

const fetchJson = (url) => {
  return fetch(url).then((response) => response.json());
};

const initialize = () => {
  const output = jQuery('#output');

  fetchJson('files.json').then(({ files }) => {
    resolutions.forEach((resolution) => {
      const groupElement = jQuery(`
        <div class="group">
          <h2>${resolution}px</h2>
        </div>
      `);
      const filesGrid = jQuery(`<div class="grid"></div>`);

      files.forEach((file) => {
        filesGrid.append(
          `<img class="icon" src="../PNG/${file}_${resolution}px.png" title="${file}">`
        );
      });

      groupElement.append(filesGrid);
      output.append(groupElement);
    });
  });
};

initialize();
