var World = {

    init: function initFn() {
        this.createOverlays();
    },

    createOverlays: function createOverlaysFn() {

        this.targetCollectionResource = new AR.TargetCollectionResource("assets/tracker.wtc", {
            onError: World.onError
        });

        this.tracker = new AR.ImageTracker(this.targetCollectionResource, {
            onTargetsLoaded: World.showInfoBar,
            onError: World.onError
        });

        this.imgOne = new AR.ImageResource("assets/solution.png", {
            onError: World.onError
        });
        this.overlayOne = new AR.ImageDrawable(this.imgOne, 1, {
            translate: {
                x: 0,    
                y: -0.55,     
                
            }
        });
        World.overlayOne.onClick = function() {
            var destUrl = "assets/explanation.html";
            window.location.href = destUrl;

        };
        function postData(){
            var scannedUrl = "https://4431-2a02-1810-141f-ef00-f13f-8ebc-e524-660f.ngrok-free.app/scanned";
            fetch(scannedUrl, {
                method: 'POST', // Gebruik POST om een nieuwe resource aan te maken
                headers: {
                    'Content-Type': 'application/json',
                },
            body: JSON.stringify({
                id: 2, // Het id van de nieuwe "scanned" record
                available_id: 1, // Het available_id van de nieuwe "scanned" record
                date: "01/11/2023", // Eventuele datum die je wilt opnemen
                imagePath: "findX.jpg" // Het image path van de nieuwe "scanned" record
               
            }),
            })
            .then(response => {
                if (response.status === 201) {
                    alert('Scanned record created successfully.');
                    // Voeg hier verdere logica toe na succesvolle aanmaak
                } else {
                    alert('Failed to create the scanned record. Server response status: ' + response.status);
                }
            })
            .catch(error => {
                console.error('Error creating the scanned record:', error);
            });
            
        }
        this.pageOne = new AR.ImageTrackable(this.tracker, "findX", {
            drawables: {
                cam: [World.overlayOne]
            },
            onImageRecognized: function(targetName) {
                World.hideInfoBar();
        
                // Roep hier je 'postdata' functie op.
                postData(); // Zorg ervoor dat je de juiste argumenten doorgeeft als dat nodig is.
        
                // Vervolgens kun je andere logica toevoegen na het herkennen van de afbeelding.
            },
            onError: World.onError
        });
    },

    onError: function onErrorFn(error) {
        alert(error);
    },

    

    hideInfoBar: function hideInfoBarFn() {
        document.getElementById("infoBox").style.display = "none";
    },

    showInfoBar: function worldLoadedFn() {
        document.getElementById("infoBox").style.display = "table";
        document.getElementById("loadingMessage").style.display = "none";
    }
};

World.init();