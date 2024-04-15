document.addEventListener('turbo:load', () => {
    console.log('turbo:load fired');
    setupDraggable();
});
document.addEventListener('DOMContentLoaded', () => {
    console.log('DOMContentLoaded fired');
    setupDraggable();
});
document.addEventListener('turbolinks:load', () => {
    console.log('turbo:load fired');
    setupDraggable();
});

function setupDraggable() {
    const frame = document.getElementById('poster-frame');
    const container = frame.parentNode;
    let offsetX, offsetY;

    frame.addEventListener('mousedown', function (e) {
      e.preventDefault();
      const rect = frame.getBoundingClientRect();
      offsetX = e.clientX - (rect.left + window.scrollX + rect.width / 2);  // 中心からのXオフセット
      offsetY = e.clientY - (rect.top + window.scrollY + rect.height / 2);  // 中心からのYオフセット

      document.addEventListener('mousemove', moveDrag, false);
      document.addEventListener('mouseup', stopDrag, false);
    }, false);

    function moveDrag(e) {
      e.preventDefault();
      // 直接ピクセル値で位置を設定
      frame.style.left = (e.clientX - offsetX - container.getBoundingClientRect().left - frame.offsetWidth / 2) + 'px';
      frame.style.top = (e.clientY - offsetY - container.getBoundingClientRect().top - frame.offsetHeight / 2) + 'px';
    }

    function stopDrag(e) {
      document.removeEventListener('mousemove', moveDrag, false);
      document.removeEventListener('mouseup', stopDrag, false);
      updateCoordinates(frame);
    }
}

function updateCoordinates(frame) {
    const container = frame.parentNode;
    const rect = frame.getBoundingClientRect();
    const centerX = (rect.left + rect.width / 2 - container.getBoundingClientRect().left) / container.offsetWidth * 100;
    const centerY = (rect.top + rect.height / 2 - container.getBoundingClientRect().top) / container.offsetHeight * 100;

    document.getElementById('poster_x').value = centerX.toFixed(2);
    document.getElementById('poster_y').value = centerY.toFixed(2);
};
