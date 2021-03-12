var wms_layers = [];


        var lyr_CartoEco_0 = new ol.layer.Tile({
            'title': 'Carto Eco',
            'type': 'base',
            'opacity': 1.000000,
            
            
            source: new ol.source.XYZ({
    attributions: ' ',
                url: 'http://cartocdn_a.global.ssl.fastly.net/base-eco/{z}/{x}/{y}.png'
            })
        });
var format_MD_Mean_Work_Hours_2010_1 = new ol.format.GeoJSON();
var features_MD_Mean_Work_Hours_2010_1 = format_MD_Mean_Work_Hours_2010_1.readFeatures(json_MD_Mean_Work_Hours_2010_1, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_MD_Mean_Work_Hours_2010_1 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_MD_Mean_Work_Hours_2010_1.addFeatures(features_MD_Mean_Work_Hours_2010_1);
var lyr_MD_Mean_Work_Hours_2010_1 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_MD_Mean_Work_Hours_2010_1, 
                style: style_MD_Mean_Work_Hours_2010_1,
                interactive: true,
    title: 'MD_Mean_Work_Hours_2010<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_0.png" /> 20.5 - 25.1<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_1.png" /> 25.1 - 34<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_2.png" /> 34 - 36.6<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_3.png" /> 36.6 - 38<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_4.png" /> 38 - 39<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_5.png" /> 39 - 39.9<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_6.png" /> 39.9 - 41<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_7.png" /> 41 - 42.6<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_8.png" /> 42.6 - 48<br />\
    <img src="styles/legend/MD_Mean_Work_Hours_2010_1_9.png" /> 48 - 56.8<br />'
        });

lyr_CartoEco_0.setVisible(true);lyr_MD_Mean_Work_Hours_2010_1.setVisible(true);
var layersList = [lyr_CartoEco_0,lyr_MD_Mean_Work_Hours_2010_1];
lyr_MD_Mean_Work_Hours_2010_1.set('fieldAliases', {'GEOID': 'GEOID', 'NAME': 'NAME', 'avg_w_E': 'avg_w_E', 'avg_w_M': 'avg_w_M', });
lyr_MD_Mean_Work_Hours_2010_1.set('fieldImages', {'GEOID': 'TextEdit', 'NAME': 'TextEdit', 'avg_w_E': 'TextEdit', 'avg_w_M': 'TextEdit', });
lyr_MD_Mean_Work_Hours_2010_1.set('fieldLabels', {'GEOID': 'no label', 'NAME': 'no label', 'avg_w_E': 'header label', 'avg_w_M': 'no label', });
lyr_MD_Mean_Work_Hours_2010_1.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});