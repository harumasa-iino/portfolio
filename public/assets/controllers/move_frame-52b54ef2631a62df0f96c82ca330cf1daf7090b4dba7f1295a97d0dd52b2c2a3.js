document.addEventListener('DOMContentLoaded', () => {
    const frame = document.getElementById('poster-frame');
    let startX, startY, initialMouseX, initialMouseY;
  
    frame.addEventListener('mousedown', function (e) {
      e.preventDefault();
      initialMouseX = e.clientX;
      initialMouseY = e.clientY;
      startX = this.offsetLeft;
      startY = this.offsetTop;
  
      document.addEventListener('mousemove', moveDrag, false);
      document.addEventListener('mouseup', stopDrag, false);
    }, false);
  
    function moveDrag(e) {
      e.preventDefault();
      var dx = e.clientX - initialMouseX;
      var dy = e.clientY - initialMouseY;
      frame.style.left = (startX + dx) + 'px';
      frame.style.top = (startY + dy) + 'px';
    }
  
    function stopDrag(e) {
      document.removeEventListener('mousemove', moveDrag, false);
      document.removeEventListener('mouseup', stopDrag, false);
      // Update hidden fields
      document.getElementById('poster_x').value = frame.style.left;
      document.getElementById('poster_y').value = frame.style.top;
    }
  });
  
