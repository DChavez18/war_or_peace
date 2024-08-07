# War or Peace Card Game

A simple card game implemented in Ruby with a Sinatra-based web interface. The game allows two players to compete in the classic card game "War" or "Peace." The game logic is handled on the backend using Ruby, while the frontend is powered by vanilla JavaScript, HTML, and CSS.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Game Rules](#game-rules)
- [License](#license)

## Features

- Classic "War" or "Peace" card game logic.
- Interactive web-based interface using vanilla JavaScript.
- Simple and clean design for an enjoyable user experience.
- Backend powered by Ruby and Sinatra.

## Installation

### Prerequisites

- Ruby (version 3.2.2 or higher)
- Bundler
- A web browser (for accessing the game)

### Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/war_or_peace.git
   cd war_or_peace


2. **Install Dependencies:**

Run the following command to install the necessary gems:

```bash
bundle install
```

3. **Run the Application:**
Start the Sinatra server:

```bash
ruby app.rb
```

The application will be available at http://localhost:4567.

## Usage

### Access the Game
Open a web browser and navigate to http://localhost:4567.

### Start a New Game

The game interface will prompt you to start a new game. Enter the names of the two players and begin playing by clicking on the "Next Turn" button.

### Play the Game

The game will proceed turn by turn.
Each turn will be played automatically after you click the "Next Turn" button.
The game continues until one player wins or the maximum number of turns is reached.

### End the Game

The game will display the winner once one player has lost all their cards or the maximum number of turns has been reached.

## Project Structure

```
war_or_peace/
├── lib/
│   ├── card.rb          # Card class
│   ├── deck.rb          # Deck class
│   ├── game.rb          # Game class
│   ├── player.rb        # Player class
│   └── turn.rb          # Turn class
├── public/
│   ├── index.html       # Frontend HTML
│   ├── app.js           # Frontend JavaScript
│   └── styles.css       # Frontend CSS
├── app.rb               # Sinatra application file
├── Gemfile              # Gemfile for bundler
├── Gemfile.lock         # Gemfile.lock for bundler
└── README.md            # Project documentation
```

## Game Rules

The game follows the basic rules of the card game "War":

The deck is split evenly between two players.
Each turn, the top card of each player's deck is compared.
The player with the higher card wins the round and takes both cards.
If the cards are of equal rank, a "war" is declared, and more cards are drawn to determine the winner.
The game continues until one player has all the cards or a set number of turns has passed.