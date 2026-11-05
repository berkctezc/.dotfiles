setInterval(() => {
  const video = document.querySelector('video');
  if (video && video.playbackRate !== 240) {
    video.playbackRate = 240;
  }
}, 100);