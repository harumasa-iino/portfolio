document.addEventListener('DOMContentLoaded', () => {
    const frame = document.getElementById('poster-frame');
    let startX, startY, startWidth, startHeight;
  
    frame.addEventListener('mousedown', (e) => {
      startX = e.clientX;
      startY = e.clientY;
      startWidth = parseInt(document.defaultView.getComputedStyle(frame).width, 10);
      startHeight = parseInt(document.defaultView.getComputedStyle(frame).height, 10);
      document.documentElement.addEventListener('mousemove', doDrag, false);
      document.documentElement.addEventListener('mouseup', stopDrag, false);
    }, false);
  
    function doDrag(e) {
      frame.style.width = (startWidth + e.clientX - startX) + 'px';
      frame.style.height = (startHeight + e.clientY - startY) + 'px';
    }
  
    function stopDrag() {
      document.documentElement.removeEventListener('mousemove', doDrag, false);    
      document.documentElement.removeEventListener('mouseup', stopDrag, false);
    }
  });
  
