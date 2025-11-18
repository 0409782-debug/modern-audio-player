<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Modern Audio Player</title>
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <main class="player-root" id="playerRoot">
    <section class="player-card glass">
      <div class="left-column">
        <div class="artwork-wrap">
          <img id="artwork" class="artwork" src="https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.0.3&s=placeholder" alt="Album art">
          <canvas id="waveformCanvas" class="waveform-canvas" aria-hidden="true"></canvas>
        </div>

        <div class="track-info">
          <div class="title-row">
            <h3 id="title">Track Title</h3>
            <span id="duration" class="duration">0:00</span>
          </div>
          <p id="artist" class="artist">Artist Name</p>
          <p id="album" class="album">Album</p>
          <div class="meta-row">
            <span id="bitrate" class="meta">—</span>
            <span id="year" class="meta">—</span>
          </div>
        </div>
      </div>

      <div class="right-column">
        <div class="controls">
          <div class="top-controls">
            <button id="shuffleBtn" class="control-btn" title="Shuffle" aria-pressed="false">🔀</button>
            <button id="prevBtn" class="control-btn" title="Previous">⏮️</button>

            <button id="playPauseBtn" class="play-btn" title="Play/Pause" aria-pressed="false">
              <span id="playIcon">▶️</span>
              <span id="pauseIcon" hidden>⏸️</span>
            </button>

            <button id="nextBtn" class="control-btn" title="Next">⏭️</button>
            <button id="repeatBtn" class="control-btn" title="Repeat (none)" aria-pressed="false">🔁</button>
          </div>

          <div class="progress-group">
            <div class="time current" id="currentTime">0:00</div>
            <div class="progress-wrap" id="progressWrap" aria-label="Seek" role="slider" tabindex="0" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
              <div id="progressBar" class="progress-bar">
                <div id="progressPlayed" class="progress-played"></div>
                <div id="progressBuffered" class="progress-buffered"></div>
              </div>
            </div>
            <div class="time total" id="totalTime">0:00</div>
          </div>

          <div class="bottom-controls">
            <div class="volume-group">
              <button id="muteBtn" class="control-btn" title="Mute">🔈</button>
              <input id="volumeSlider" class="volume-slider" type="range" min="0" max="1" step="0.01" value="0.8" aria-label="Volume" />
            </div>

            <div class="extra-controls">
              <label class="switch">
                <input id="visualToggle" type="checkbox" checked>
                <span>Waveform</span>
              </label>
            </div>
          </div>
        </div>

        <aside class="playlist" aria-label="Playlist">
          <header class="playlist-header">
            <h4>Playlist</h4>
            <div class="playlist-actions">
              <button id="shuffleListBtn" title="Shuffle playlist">Shuffle</button>
              <button id="clearListBtn" title="Clear playlist">Clear</button>
            </div>
          </header>
          <ul id="playlistList" class="playlist-list"></ul>
        </aside>
      </div>
    </section>
  </main>

  <!-- Hidden native audio element used by the app -->
  <audio id="audio" crossorigin="anonymous"></audio>

  <script src="app.js" defer></script>
</body>
</html>
