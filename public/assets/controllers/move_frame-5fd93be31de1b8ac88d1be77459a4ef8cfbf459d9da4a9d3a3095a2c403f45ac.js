document.addEventListener('turbo:load', setupDraggable);
document.addEventListener('DOMContentLoaded', setupDraggable);

function setupDraggable() {
    const frame = document.getElementById('poster-frame');
    const container = frame.parentNode;  // 画像コンテナを取得
    let startX, startY, initialMouseX, initialMouseY;

    frame.addEventListener('mousedown', function (e) {
      e.preventDefault();
      initialMouseX = e.clientX;
      initialMouseY = e.clientY;
      startX = frame.getBoundingClientRect().left + frame.offsetWidth / 2;  // 中心X座標の取得
      startY = frame.getBoundingClientRect().top + frame.offsetHeight / 2;  // 中心Y座標の取得

      document.addEventListener('mousemove', moveDrag, false);
      document.addEventListener('mouseup', stopDrag, false);
    }, false);

    function moveDrag(e) {
      e.preventDefault();
      const dx = e.clientX - initialMouseX;
      const dy = e.clientY - initialMouseY;
      frame.style.left = `calc(${startX + dx}px - 50%)`;  // 中心基準での位置調整
      frame.style.top = `calc(${startY + dy}px - 50%)`;  // 中心基準での位置調整
    }

    function stopDrag(e) {
      document.removeEventListener('mousemove', moveDrag, false);
      document.removeEventListener('mouseup', stopDrag, false);
      updateCoordinates(frame);
    }
}

function updateCoordinates(frame) {
    const container = frame.parentNode;
    // 実際のDOM要素の座標を取得し、中心座標を計算
    const centerX = (frame.getBoundingClientRect().left + frame.offsetWidth / 2 - container.getBoundingClientRect().left) / container.offsetWidth * 100;
    const centerY = (frame.getBoundingClientRect().top + frame.offsetHeight / 2 - container.getBoundingClientRect().top) / container.offsetHeight * 100;

    document.getElementById('poster_x').value = centerX.toFixed(2);  // 小数点以下2桁で四捨五入
    document.getElementById('poster_y').value = centerY.toFixed(2);
};
