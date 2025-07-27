const resolutions = [256, 48, 32, 24, 16];

const fetchJson = (url) => {
  return fetch(url).then((response) => response.json());
};

const initialize = () => {
  const output = jQuery('#output');

  resolutions.forEach((resolution) => {
    const groupElement = jQuery(`
      <div class="group open px${resolution}"></div>
    `);
    groupElement.css('--icon-size', `${Math.min(resolution, 96)}px`);
    const groupTitle = jQuery(`
      <div class="group__title">
        <span class="chevron">&#709;</span>
        ${resolution} x ${resolution}
      </div>
    `);
    const groupContent = jQuery(`<div class="group__content"></div>`);
    groupTitle.on('click', () => groupElement.toggleClass('open'));

    const filesGrid = jQuery(`<div class="grid"></div>`);
    files.forEach((file) => {
      const path = `../PNG/${file}_${resolution}px.png`;
      filesGrid.append(`
        <a class="cell" href="${path}" target="_blank">
          <img class="icon ${
            resolution !== 256 ? 'pixelated' : ''
          }" src="${path}" title="${file}">
          <span>${file}</span>
        </a>
      `);
    });

    groupContent.append(filesGrid);
    groupElement.append(groupTitle);
    groupElement.append(groupContent);
    output.append(groupElement);
  });
};

initialize();
