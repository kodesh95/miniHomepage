document.addEventListener('DOMContentLoaded', function () {
  const savedIndex = loadCurrentSongIndex();

  if (savedIndex !== null) {
    loadSong(songs[savedIndex]);

    const isPlaying = musicContainer.classList.contains('play');
    if (isPlaying) {
      playMusic();
    }
  }
});

// 페이지 간의 상태 유지를 위한 함수
function saveCurrentSongIndex(index) {
  localStorage.setItem('currentSongIndex', index);
}

function loadCurrentSongIndex() {
  return localStorage.getItem('currentSongIndex');
}




// 음악메인영역
const musicContainer = document.getElementById("musicContainer");
// 실제 음악 파일
const audio = document.getElementById("audio");

// buttons
const playBtn = document.getElementById("play");
const prevBtn = document.getElementById("prev");
const nextBtn = document.getElementById("next");

// 음약 이미지
const imgCover = document.getElementById("cover");

const songs = ["mol1", "mol2"];
let songIndex = 0;




loadSong(songs[songIndex]);

function loadSong(song) {
  audio.src = `/gaest/resources/audio_img/${song}.mp3`;
  imgCover.src = `/gaest/resources/audio_img/${song}.jpg`;
}

function playMusic() {
  musicContainer.classList.add("play");
  playBtn.innerHTML = `<i class="fa-solid fa-pause"></i>`;
  audio.play();
}

function pauseMusic() {
  musicContainer.classList.remove('play');
  playBtn.innerHTML = `<i class="fa-solid fa-play"></i>`;
  audio.pause();
}

function playPrevSong() {
  songIndex--;
  if (songIndex < 0) {
    songIndex = songs.length - 1;
  }
  loadSong(songs[songIndex]);
  playMusic();
}

function playNextSong() {
  songIndex++;
  if (songIndex > songs.length - 1) {
    songIndex = 0;
  }
  loadSong(songs[songIndex]);
  playMusic();
}

playBtn.addEventListener("click", () => {
  const isPlaying = musicContainer.classList.contains('play');
  if (isPlaying) {
    pauseMusic();
  } else {
    playMusic();
  }
});



prevBtn.addEventListener("click", playPrevSong);
nextBtn.addEventListener('click', playNextSong);
audio.addEventListener('ended', playNextSong);
