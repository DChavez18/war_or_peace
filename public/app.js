// Example initial game state (this could be set up when the game starts)
let game = { id: null, player1: {}, player2: {}, turnCount: 0 };

// Function to initialize the game, called when starting a new game
function initializeGame() {
  fetch('/start_game', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      player1_name: 'Player 1',
      player2_name: 'Player 2'
    })
  })
  .then(response => response.json())
  .then(data => {
    // Save the game state from the server
    game = data;
    updateUI();
  });
}

// Function to handle the next turn
function nextTurn() {
  fetch('/next_turn', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ game_id: game.id }) // Send the current game ID
  })
  .then(response => response.json())
  .then(data => {
    // Update the game state with the response data
    game = data;
    updateUI();
  });
}

// Function to update the UI based on the current game state
function updateUI() {
  document.getElementById('player1-cards').textContent = `Cards left: ${game.player1.deck.length}`;
  document.getElementById('player2-cards').textContent = `Cards left: ${game.player2.deck.length}`;
  document.getElementById('game-status').textContent = `Turn: ${game.turnCount}`;
}

// Event listener for "Next Turn" button
document.getElementById('next-turn-button').addEventListener('click', nextTurn);

// Initialize the game on page load or user action
initializeGame();