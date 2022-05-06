const fetchJson = (url) => {
  return fetch(url).then((response) => response.json());
};

const initialize = () => {
  const output = jQuery('#output');

  fetchJson('files.json').then(({ files }) => {
    const filesGrid = jQuery(`<div class="grid"></div>`);

    files.forEach((file) => {
      filesGrid.append(
        `<img class="icon" src="../PNG/${file}_256px.png" title="${file}">`
      );
    });

    output.append(filesGrid);
  });
};

initialize();
