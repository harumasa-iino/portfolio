document.addEventListener('turbo:load', setupDraggable);
document.addEventListener('DOMContentLoaded', setupDraggable);

function setupDraggable() {
  const frame = document.getElementById('poster-frame');
  const container = frame.parentNode;
  let offsetX, offsetY;
  let isDragging = false;


  frame.addEventListener('mousedown', startDrag);
  frame.addEventListener('touchstart', startDrag);

  function startDrag(e) {
    e.preventDefault();
    isDragging = true;

    if (e.type === 'mousedown') {
      const rect = frame.getBoundingClientRect();
      offsetX = e.clientX - (rect.left + window.scrollX);
      offsetY = e.clientY - (rect.top + window.scrollY);
    } else {
      const touch = e.touches[0];
      const rect = frame.getBoundingClientRect();
      offsetX = touch.clientX - (rect.left + window.scrollX);
      offsetY = touch.clientY - (rect.top + window.scrollY);
    }

    document.addEventListener('mousemove', moveDrag);
    document.addEventListener('touchmove', moveDrag);
    document.addEventListener('mouseup', stopDrag);
    document.addEventListener('touchend', stopDrag);
  }

  function moveDrag(e) {
    e.preventDefault();

    if (isDragging) {
      if (e.type === 'mousemove') {
        frame.style.left = (e.clientX - offsetX - container.getBoundingClientRect().left) + 'px';
        frame.style.top = (e.clientY - offsetY - container.getBoundingClientRect().top) + 'px';
      } else {
        const touch = e.touches[0];
        frame.style.left = (touch.clientX - offsetX - container.getBoundingClientRect().left) + 'px';
        frame.style.top = (touch.clientY - offsetY - container.getBoundingClientRect().top) + 'px';
      }
    }
  }

  function stopDrag(e) {
    isDragging = false;
    document.removeEventListener('mousemove', moveDrag);
    document.removeEventListener('touchmove', moveDrag);
    document.removeEventListener('mouseup', stopDrag);
    document.removeEventListener('touchend', stopDrag);
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
}
