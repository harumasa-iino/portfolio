document.addEventListener('turbo:load', setupDraggable);
document.addEventListener('DOMContentLoaded', setupDraggable);

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
      frame.style.left = `calc(${e.clientX - offsetX}px - 50%)`;  // 中心基準での位置調整
      frame.style.top = `calc(${e.clientY - offsetY}px - 50%)`;  // 中心基準での位置調整
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
