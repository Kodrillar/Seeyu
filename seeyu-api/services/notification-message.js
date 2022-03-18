const notifications = [
    "Hello, there's an Intruder!",
    "Good day, someone stepped in!",
    "See who stepped in not quite long.",
    "Check who just stepped in recently."
]

module.exports = notifications[Math.floor(Math.random()*notifications.length)];