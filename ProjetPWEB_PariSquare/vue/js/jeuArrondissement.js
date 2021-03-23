
// =============================================== Variables globales de la carte Leaflet ==================================================
console.log("Chargement du jeu...");
// Initialisation de la <div> "carteArrondissement" en tant que carte Leaflet
var carte = L.map('carteArrondissement').setView([48.862162, 2.345818], 12);

// Délimitation de la zone de zoom de "carteArrondissement" + Niveau de zoom initial
var southWest = L.latLng(48.747958, 1.997363);
var northEast = L.latLng(48.900000, 2.66064);
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
var arrondissementIdx;
var highlightedFeature;
var geojson;
var jsonToFeature;
var namesLookUp;
var cnt = 0;
var etat = "open";


if (get("id"))
	randomize(get("id"));
else
    randomize(Date());

var shuffleArray = new Array();
for (var i = 0; i < arrondissements.features.length; i++) {
	shuffleArray[i] = i;
}
shuffle(shuffleArray);

var info = L.control();

info.onAdd = function (carte) {
	this._div = L.DomUtil.create('div', 'info leaflet-bar');
	return this._div;
};

info.update = function () {
	var headerText = "Trouvez le :";
	var resolveText = "Solution";
	var nextText = "Suivant";
	var color = (etat==="correct")? ";background-color:#8f8" : (etat==="wrong")? ";background-color:#f88" : "";

	var html = '' + '<div style=";color:#fff">' + headerText +'</div>' +'<div style="text-align: center' + color + 
	'"><h4>' +'<div style=";color:#686666">'+ getFeatureName(arrondissements.features[arrondissementIdx]) + '</h4></div></div>';
	html = html + '<div style="text-align: right">';

	if (etat === "open")
		html = html + '<input type="button" value="' + resolveText + '" onclick="resoudre(false)">';
	else
		html = html + '<input type="button" value="' + nextText + '" onclick="arrondissementSuivant()">';

	html = html + '</div>';

	this._div.innerHTML = html;
};
info.addTo(carte);

miseAJour();

arrondissementSuivant();

function get(name) {
	if (name = (new RegExp('[?&]' + encodeURIComponent(name) + '=([^&]*)')).exec(location.search))
		return decodeURIComponent(name[1]);
}


function verifReponse(id) {
	var correct = (id === arrondissements.features[arrondissementIdx].id);

	if ((etat==="open") && correct)
		resoudre(true);
	else {
		var feature = jsonToFeature[id];
		highlightFeature(feature, correct? '#afa' : "#faa");
	}
}

function arrondissementSuivant() {
	if (highlightedFeature)
		geojson.resetStyle(highlightedFeature);

	arrondissementIdx = shuffleArray[cnt++ % shuffleArray.length];
	carte.fitWorld();

	etat = "open";
	updateUI();
}

function resoudre(correct) {
	etat = correct? "correct" : "wrong";
	var feature = jsonToFeature[arrondissements.features[arrondissementIdx].id];

	highlightFeature(feature, '#afa');
	carte.fitBounds(feature.getBounds().pad(.5));

	updateUI();
}

function updateUI() {
	carte.setView([48.862162, 2.345818], 12);
	info.update();
}
function highlightFeature(layer, c) {
	if (highlightedFeature)
		geojson.resetStyle(highlightedFeature);

	layer.setStyle({
		weight: 5,
		color: '#666',
		dashArray: '',
		fillColor: c,
		fillOpacity: 0.3
	});

	highlightedFeature = layer;

	layer.bringToFront();
}

function zoomToFeature(e) {
	var layer = e.target;
	verifReponse(layer.feature.id);
}

function onEachFeature(feature, layer) {
	jsonToFeature[feature.id] = layer;
	var popupContent = "<p>Tu as cliqué sur le " + feature.properties.name;
	layer.bindPopup(popupContent);

	layer.on({
		click: zoomToFeature
	});
}

function getFeatureName(feature) {
	return feature.properties.name;
}

function miseAJour() {
	jsonToFeature = {};
	if (geojson)
		carte.removeLayer(geojson);
		


	geojson = L.geoJson(arrondissements, {
		onEachFeature: onEachFeature,
	}).addTo(carte);

}