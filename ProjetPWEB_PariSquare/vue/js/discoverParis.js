
// =============================================== Variables globales de la carte Leaflet ==================================================
console.log("Chargement du jeu...");

// Initialisation de la <div> "carteArrondissement" en tant que carte Leaflet
var carte = L.map('carteDiscoverParis', {
}).setView([48.862162, 2.345818], 12);

// Délimitation de la zone de zoom de "carteArrondissement" + Niveau de zoom initial
var southWest = L.latLng(48.747958, 1.997363);
var northEast = L.latLng(48.991195, 2.66064);
var bounds = L.latLngBounds(southWest, northEast);
carte.options.maxBounds = bounds;
carte.options.minZoom = 12;
carte.options.maxZoom = 17;

// Création d’une couche « CartoDB_DarkMatter » + Crédits
CartoDB_DarkMatterNoLabels = L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_nolabels/{z}/{x}/{y}{r}.png', {
	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">PariSquare</a> contributors &copy; <a href="https://carto.com/attributions">G.Christian | M.Yoann | S.Darlène </a>',
	subdomains: 'abcd',
});
// Ajout de la couche « CartoDB_DarkMatterNoLabels » à la carte
carte.addLayer(CartoDB_DarkMatterNoLabels);
console.log("Chargement terminé !");
// =============================================== Initialisation de la carte Leaflet ==================================================
function initialize() {
	//Délimitation de Paris et de ses arrondissements
	L.geoJSON([arrondissements], {
		style: function (feature) {
			return feature.properties && feature.properties.style;
		},
	}).addTo(carte);
	//Condition permettant de mettre la couche au premier plan et éviter les problèmes d'affichage sur certains navigateurs 
		if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
			layer.bringToFront();
		}
	
}

var mairiesIcon = L.icon({
	iconUrl: 'https://img.icons8.com/nolan/30/city-hall.png',
	iconSize:     [35, 40], // taille de l'icone
	iconAnchor:   [35, 40], // là où va pointer l'icone 
	popupAnchor:  [-20, -40] // là où le popup apparaît relatif à l'icone
});
var mairiesLayer = L.geoJSON(mairies,{
	pointToLayer: function(feature,latlng){
		var marker = L.marker(latlng,{icon: mairiesIcon});
		marker.bindPopup("<b><u>Description</u></b><br>"
				 + "<b>Lieu : </b>" + feature.properties.lieu+ '<br>' 
				 + "<b>Adresse : </b>" + feature.properties.adresse+ '<br>' 
				 + "<b>Catégorie : </b>" + feature.properties.categ
				 );
		return marker;
		}
});

var monumentsIcon = L.icon({
	iconUrl: 'https://img.icons8.com/nolan/30/greek-pillar-capital.png',
	iconSize:     [35, 40], // taille de l'icone
	iconAnchor:   [35, 40], // là où va pointer l'icone 
	popupAnchor:  [-20, -40] // là où le popup apparaît relatif à l'icone
});
var monumentsLayer = L.geoJSON(monuments,{
	pointToLayer: function(feature,latlng){
		var marker = L.marker(latlng,{icon: monumentsIcon});
		marker.bindPopup("<b><u>Description</u></b><br>"
				 + "<b>Lieu : </b>" + feature.properties.lieu+ '<br>' 
				 + "<b>Adresse : </b>" + feature.properties.adresse+ '<br>' 
				 + "<b>Catégorie : </b>" + feature.properties.categ
				 );
		return marker;
		}
});

var garesIcon = L.icon({
	iconUrl: 'https://img.icons8.com/nolan/24/train.png',
	iconSize:     [35, 40], // taille de l'icone
	iconAnchor:   [35, 40], // là où va pointer l'icone 
	popupAnchor:  [-20, -40] // là où le popup apparaît relatif à l'icone
});
var garesLayer = L.geoJSON(gares,{
	pointToLayer: function(feature,latlng){
		var marker = L.marker(latlng,{icon: garesIcon});
		marker.bindPopup("<b><u>Description</u></b><br>"
				 + "<b>Lieu : </b>" + feature.properties.lieu+ '<br>' 
				 + "<b>Adresse : </b>" + feature.properties.adresse+ '<br>' 
				 + "<b>Catégorie : </b>" + feature.properties.categ
				 );
		return marker;
		}
});



function mairiesDisplay() {
	var checkBoxMairies = document.getElementById("mairies");
	if (checkBoxMairies.checked == true) {
		mairiesLayer.addTo(carte);
	
} else {
	carte.removeLayer(mairiesLayer);
}
}

function monumentsDisplay() {
	var checkBoxMonuments = document.getElementById("monuments");
	if (checkBoxMonuments.checked == true) {
	monumentsLayer.addTo(carte);
} else {
	carte.removeLayer(monumentsLayer);
}
}
function garesDisplay() {
	var checkBoxGares = document.getElementById("gares");
	if (checkBoxGares.checked == true) {
	garesLayer.addTo(carte);
} else {
	carte.removeLayer(garesLayer);
}
}

// ======================================= Routing ===============================
const apiKey = "AAPK0c5432df993544228777df848a6d99f3eR7k6Ikh17eUFzxjJ3kthKOZtY7Lkkwoe9t2KKUIdRYO_mp0hp_XqfZ7hy6ja6ya";

// Ajoute un DOM Node pour afficher les directions
const directions = document.createElement("div");
directions.id = "directions";
directions.innerHTML = "Cliquez deux fois sur la carte pour définir votre point de départ et d'arrivée et afficher un itinéraire";
document.getElementById("carteDiscoverParis").appendChild(directions);

// Layers des markers
const startLayerGroup = L.layerGroup().addTo(carte);
const endLayerGroup = L.layerGroup().addTo(carte);

// Layer de l'itinéraire
const routeLines = L.layerGroup().addTo(carte);

let currentStep = "start";
let startCoords, endCoords;

function updateRoute() {
	// CCréer la variable pour la récupérer la clé api
	const authentication = new arcgisRest.ApiKey({
		key: apiKey
	});

	// Requête api
	arcgisRest
		.solveRoute({
			stops: [startCoords, endCoords],
			endpoint: "https://route-api.arcgis.com/arcgis/rest/services/World/Route/NAServer/Route_World/solve?directionsLanguage=fr",
			authentication
		})
		.then((response) => {
			// Show the result route on the map.
			routeLines.clearLayers();
			L.geoJSON(response.routes.geoJson).addTo(routeLines);

			// Show the result text directions on the map.
			const directionsHTML = response.directions[0].features.map((f) => f.attributes.text).join("<br/>");
			directions.innerHTML = directionsHTML;
			startCoords = null;
			endCoords = null;
		})
		.catch((error) => {
			console.error(error);
			alert("Erreur lors de l'appel de l'api. Voir la console pour plus de détails");
		});
}

//PLace les layers ou les retire sur la map selon l'état de l'itinéraire (s'il y a une route ou non)
carte.on("click", (e) => {
	const coordinates = [e.latlng.lng, e.latlng.lat];

	if (currentStep === "start") {
		startLayerGroup.clearLayers();
		endLayerGroup.clearLayers();
		routeLines.clearLayers();
		L.marker(e.latlng).addTo(startLayerGroup);
		startCoords = coordinates;
		currentStep = "end";
	} else {
		L.marker(e.latlng).addTo(endLayerGroup);
		endCoords = coordinates;
		currentStep = "start";
	}

	if (startCoords && endCoords) {
		updateRoute();
	}
});

	
	

