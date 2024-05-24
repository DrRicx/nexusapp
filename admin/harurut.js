document.addEventListener('DOMContentLoaded', () => {
    // Function to show the selected section
    window.showSection = function(sectionId) {
        // Hide all sections
        const sections = document.querySelectorAll('.content-section');
        sections.forEach(section => {
            section.classList.remove('content-section-active');
        });
        
        // Show the selected section
        const activeSection = document.getElementById(sectionId);
        if (activeSection) {
            activeSection.classList.add('content-section-active');
        }
        
        // Redraw charts if the section contains them
        if (sectionId === 'usage-graphs') {
            drawCharts();
        }
    };

    // Function to draw charts
    function drawCharts() {
        const ctx1 = document.getElementById('serverUsageChart').getContext('2d');
        const ctx2 = document.getElementById('userGrowthChart').getContext('2d');
        
        new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Server 1', 'Server 2', 'Server 3', 'Server 4', 'Server 5'],
                datasets: [{
                    label: 'Usage',
                    data: [10, 20, 30, 40, 50],
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        new Chart(ctx2, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May'],
                datasets: [{
                    label: 'User Growth',
                    data: [5, 10, 15, 20, 25],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    // Show the first section by default
    showSection('server-management');
});
