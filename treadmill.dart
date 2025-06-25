script.js
let totalMinutes = 0;
let currentLevel = 1;
let speed = 20;
let interval;

function startFocus() {
  const minutes = parseInt(document.getElementById("focusTime").value);
  if (isNaN(minutes) || minutes <= 0) {
    alert("Please enter a valid number of minutes!");
    return;
  }

  let timeLeft = minutes * 60;
  updateTimeDisplay(timeLeft);

  interval = setInterval(() => {
    timeLeft--;
    updateTimeDisplay(timeLeft);

    if (timeLeft <= 0) {
      clearInterval(interval);
      alert("🎉 Focus session complete!");
      totalMinutes += minutes;
      updateTrainingLog();
    }
  }, 1000);
}

function updateTimeDisplay(seconds) {
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  document.getElementById("timeLeft").textContent =
    String(mins).padStart(2, "0") + ":" + String(secs).padStart(2, "0");
}

function updateTrainingLog() {
  document.getElementById("totalTime").textContent = totalMinutes;

  currentLevel = Math.floor(totalMinutes / 100) + 1;
  speed = 20 + (currentLevel - 1) * 15;

  document.getElementById("level").textContent = currentLevel;
  document.getElementById("speed").textContent = speed;
}
