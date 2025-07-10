document.addEventListener("turbo:load",  setupDraggable);
document.addEventListener("DOMContentLoaded", setupDraggable);

function setupDraggable() {
  const frame      = document.getElementById("poster-frame");
  const container  = frame.parentNode;
  let offsetX = 0, offsetY = 0, isDragging = false;

  /* ――― ドラッグ開始 ――― */
  frame.addEventListener("mousedown",  startDrag);
  frame.addEventListener("touchstart", startDrag, { passive: false });

  function startDrag(ev) {
    ev.preventDefault();
    isDragging = true;

    const { pageX, pageY } = getPoint(ev);
    const rect = frame.getBoundingClientRect();
    const scrollX = window.scrollX, scrollY = window.scrollY;

    // クリックした位置とフレーム左上の差分を保存
    offsetX = pageX - (rect.left + scrollX);
    offsetY = pageY - (rect.top  + scrollY);

    document.addEventListener("mousemove",  dragMove);
    document.addEventListener("touchmove", dragMove, { passive: false });
    document.addEventListener("mouseup",    endDrag);
    document.addEventListener("touchend",  endDrag);
  }

  /* ――― ドラッグ中 ――― */
  function dragMove(ev) {
    if (!isDragging) return;
    ev.preventDefault();

    const { pageX, pageY } = getPoint(ev);

    const containerRect = container.getBoundingClientRect();
    const scrollX = window.scrollX, scrollY = window.scrollY;

    const newLeft = pageX - offsetX - (containerRect.left + scrollX);
    const newTop  = pageY - offsetY - (containerRect.top  + scrollY);

    frame.style.left = `${newLeft}px`;
    frame.style.top  = `${newTop}px`;
  }

  /* ――― ドラッグ終了 ――― */
  function endDrag() {
    isDragging = false;
    document.removeEventListener("mousemove",  dragMove);
    document.removeEventListener("touchmove", dragMove);
    document.removeEventListener("mouseup",    endDrag);
    document.removeEventListener("touchend",  endDrag);
    updateCoordinates(frame);
  }

  /* ――― マウス／タッチ座標を pageX/pageY に統一 ――― */
  function getPoint(ev) {
    if (ev.type.startsWith("touch")) {
      const t = ev.touches[0] || ev.changedTouches[0];
      return { pageX: t.pageX, pageY: t.pageY };
    } else {
      return { pageX: ev.pageX, pageY: ev.pageY };
    }
  }
}

/* ---------------- 座標をフォームに保存 ---------------- */
function updateCoordinates(frame) {
  const container = frame.parentNode;
  const rect      = frame.getBoundingClientRect();
  const cRect     = container.getBoundingClientRect();

  const centerX = ((rect.left - cRect.left) + rect.width  / 2) / container.offsetWidth  * 100;
  const centerY = ((rect.top  - cRect.top ) + rect.height / 2) / container.offsetHeight * 100;

  document.getElementById("poster_x").value = centerX.toFixed(2);
  document.getElementById("poster_y").value = centerY.toFixed(2);
}
