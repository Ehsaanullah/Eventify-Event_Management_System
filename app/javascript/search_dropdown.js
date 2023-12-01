// app/assets/javascripts/search_dropdown.js
document.addEventListener("DOMContentLoaded", function () {
  const toggleSearchButton = document.getElementById("toggle-search");
  const searchDropdown = document.getElementById("search-dropdown");

  toggleSearchButton.addEventListener("click", function () {
    if (searchDropdown.style.display === "none") {
      searchDropdown.style.display = "block";
    } else {
      searchDropdown.style.display = "none";
    }
  });
});
