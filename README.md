```markdown
# Modern Audio Player

This is a self-contained, modern web audio player with:
- Play / Pause
- Next / Previous
- Progress bar with scrubbing and buffered indicator
- Volume control and mute
- Playlist with clickable tracks
- Shuffle and Repeat (none / all / one)
- Track information (title, artist, album art)
- Waveform visualization using the Web Audio API
- Smooth animations and responsive design
- Accessible controls (ARIA attributes + keyboard shortcuts)

How it works
- The UI wraps a native <audio> element.
- The Web Audio API (AudioContext + AnalyserNode) reads audio data to draw a waveform on a canvas.
- Playback controls update the audio element and UI.
- Shuffle uses a randomized order or picks random next tracks.
- Repeat has three modes:
  - none: stop at end
  - all: cycle playlist
  - one: repeat the current track

Usage
1. Open `index.html` in a modern browser (Chrome, Edge, Firefox).
2. The demo playlist includes a few sample remote MP3s. You can replace them in `app.js` with your own URLs.
3. Click Play — note browsers may require user interaction to start audio and to unlock the AudioContext.

Keyboard shortcuts
- Space: Play / Pause
- ArrowRight: Next
- ArrowLeft: Previous
- ArrowUp / ArrowDown: Volume up / down

Accessibility
- Controls include ARIA labels and keyboard focusability.
- The waveform canvas is decorative; main interactions are available with buttons/inputs.

Files
- index.html — markup and structure
- styles.css — modern UI styles and animations
- app.js — core logic, audio handling, waveform rendering

Notes & Improvements
- Add drag-and-drop to load local files.
- Persist user preferences (volume, shuffle, repeat) to localStorage.
- Preload and decode tracks for instant waveform preview.
- Add equalizer / visualizer presets.

```
