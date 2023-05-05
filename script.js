document.getElementById('search-btn').addEventListener('click', function () {
    let searchInput = document.getElementById('search-input').value;
    searchShoes(searchInput);
});

document.getElementById('open-crate-btn').addEventListener('click', function () {
    let crateContainer = document.getElementById('crate-container');
    const intervalId = setInterval(changeCrateColors, 100, crateContainer);
    setTimeout(function () {
        clearInterval(intervalId);
        openCrate(crateContainer);
        //increase number for extra time
    }, 10000);
});

async function searchShoes() {
    const searchInput = document.getElementById('search-input').value;

    const response = await fetch(`http://localhost:3000/search?searchInput=${searchInput}`);
    const data = await response.json();

    displayResults(data);
    displayShoeCrates(data);
}

function displayResults(results) {
    let tableBody = document.getElementById('result-table-body');
    tableBody.innerHTML = '';

    results.forEach(result => {
        let row = document.createElement('tr');

        for (const key in result) {
            let cell = document.createElement('td');
            cell.textContent = result[key];
            row.appendChild(cell);
        }

        tableBody.appendChild(row);
    });
}

function displayShoeCrates(results) {
    const crateContainer = document.getElementById('crate-container');
    crateContainer.innerHTML = '';

    results.forEach((result, index) => {
        const shoeCrate = document.createElement('div');
        shoeCrate.className = 'shoe-crate';

        const shoeName = document.createElement('p');
        shoeName.innerText = `${result.Name} - ${result.Color} - ${result.Price}`;
        shoeCrate.appendChild(shoeName);

        crateContainer.appendChild(shoeCrate);
    });
}

function openCrate(crateContainer) {
    const openCrateSound = document.getElementById("open-crate-sound");
    openCrateSound.currentTime = 0; // Reset the sound to the beginning
    openCrateSound.play();
    const selectedShoeIndex = Math.floor(Math.random() * crateContainer.children.length);
    const selectedShoe = crateContainer.children[selectedShoeIndex];

    Array.from(crateContainer.children).forEach((child, index) => {
        if (index !== selectedShoeIndex) {
            child.style.opacity = 0.3;
        }
    });

    selectedShoe.style.transform = 'scale(1.1)';
    selectedShoe.style.backgroundColor = '#7986cb';
    selectedShoe.style.color = 'white';
}

function changeCrateColors(crateContainer) {
    Array.from(crateContainer.children).forEach((child) => {
        child.style.backgroundColor = getRandomColor();
    });
}

function getRandomColor() {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
