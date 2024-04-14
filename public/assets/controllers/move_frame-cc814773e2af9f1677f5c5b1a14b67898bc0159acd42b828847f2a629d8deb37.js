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
      startX = frame.offsetLeft;
      startY = frame.offsetTop;
  
      document.addEventListener('mousemove', moveDrag, false);
      document.addEventListener('mouseup', stopDrag, false);
    }, false);
  
    function moveDrag(e) {
      e.preventDefault();
      const dx = e.clientX - initialMouseX;
      const dy = e.clientY - initialMouseY;
      frame.style.left = (startX + dx) + 'px';
      frame.style.top = (startY + dy) + 'px';
    }
  
    function stopDrag(e) {
      document.removeEventListener('mousemove', moveDrag, false);
      document.removeEventListener('mouseup', stopDrag, false);
      updateCoordinates(frame);  // 位置の更新を関数で行う
    }
}

function updateCoordinates(frame) {
    const container = frame.parentNode;
    // フレームの中心座標を計算
    const centerX = (frame.offsetLeft + frame.offsetWidth / 2) / container.offsetWidth * 100;
    const centerY = (frame.offsetTop + frame.offsetHeight / 2) / container.offsetHeight * 100;

    document.getElementById('poster_x').value = centerX.toFixed(2);  // 小数点以下2桁で四捨五入
    document.getElementById('poster_y').value = centerY.toFixed(2);
};
