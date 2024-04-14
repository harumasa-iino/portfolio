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
      startX = frame.offsetLeft + frame.offsetWidth / 2;  // フレーム中心のX座標
      startY = frame.offsetTop + frame.offsetHeight / 2;  // フレーム中心のY座標
  
      document.addEventListener('mousemove', moveDrag, false);
      document.addEventListener('mouseup', stopDrag, false);
    }, false);
  
    function moveDrag(e) {
      e.preventDefault();
      const dx = e.clientX - initialMouseX;
      const dy = e.clientY - initialMouseY;
      frame.style.left = (startX + dx - frame.offsetWidth / 2) + 'px';  // 中心基準での位置調整
      frame.style.top = (startY + dy - frame.offsetHeight / 2) + 'px';  // 中心基準での位置調整
    }
  
    function stopDrag(e) {
      document.removeEventListener('mousemove', moveDrag, false);
      document.removeEventListener('mouseup', stopDrag, false);
      updateCoordinates(frame);
    }
}

function updateCoordinates(frame) {
    const container = frame.parentNode;
    // フレーム中心の座標を再計算して更新
    const centerX = (frame.offsetLeft + frame.offsetWidth / 2) / container.offsetWidth * 100;
    const centerY = (frame.offsetTop + frame.offsetHeight / 2) / container.offsetHeight * 100;

    document.getElementById('poster_x').value = centerX.toFixed(2);  // 小数点以下2桁で四捨五入
    document.getElementById('poster_y').value = centerY.toFixed(2);
};
