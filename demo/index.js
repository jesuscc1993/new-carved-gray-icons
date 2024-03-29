const resolutions = [256, 48, 32, 24, 16];

const fetchJson = (url) => {
  return fetch(url).then((response) => response.json());
};

const initialize = () => {
  const output = jQuery('#output');

  resolutions.forEach((resolution) => {
    const groupElement = jQuery(`
      <div class="group px${resolution}">
        <div class="title">${resolution}px</div>
      </div>
    `);
    const groupContent = jQuery(`<div class="content"></div>`);
    const filesGrid = jQuery(`<div class="grid"></div>`);

    files.forEach((file) => {
      const path = `../PNG/${file}_${resolution}px.png`;
      filesGrid.append(`
        <a href="${path}" target="_blank">
          <img class="icon" src="${path}" title="${file}">
        </a>
      `);
    });

    groupContent.append(filesGrid);
    groupElement.append(groupContent);
    output.append(groupElement);
  });
};

initialize();
