
const data = [
  { "id": 1, "color_lv": "Balti", "hexCode": "FFFFFF" },
  { "id": 2, "color_lv": "Dzelteni", "hexCode": "FFFF00" },
  { "id": 3, "color_lv": "Oranži", "hexCode": "FFA500" },
  { "id": 4, "color_lv": "Gaiši sarkani", "hexCode": "FF6347" },
  { "id": 5, "color_lv": "Sarkani", "hexCode": "FF0000" },
  { "id": 6, "color_lv": "Tumši sarkani", "hexCode": "8B0000" },
  { "id": 7, "color_lv": "Laima", "hexCode": "00FF00" },
  { "id": 8, "color_lv": "Gaiši zaļi", "hexCode": "90EE90" },
  { "id": 9, "color_lv": "Zaļš", "hexCode": "008000" },
  { "id": 10, "color_lv": "Tumši zaļi", "hexCode": "006400" },
  { "id": 11, "color_lv": "Gaiši zili", "hexCode": "ADD8E6" },
  { "id": 12, "color_lv": "Zili", "hexCode": "0000FF" },
  { "id": 13, "color_lv": "Tumši zili", "hexCode": "00008B" },
  { "id": 14, "color_lv": "Brūni", "hexCode": "A52A2A" },
  { "id": 15, "color_lv": "Violeti", "hexCode": "C71585" },
  { "id": 16, "color_lv": "Rozā", "hexCode": "FFC0CB" },
  { "id": 17, "color_lv": "Melni", "hexCode": "000000" }
];


let dbInsertsList = [];

let insertAllText = "INSERT INTO colors (id,color_lv,hex_code) values";
data.forEach((item, transIndex) => {
  let text = `(${item[0]},"${item[1]}","${item[2]}")`;
  text += transIndex + 1 == data.length ? ';' : ',';
  dbInsertsList.push(text);
});
let insertText = `${insertAllText} ${dbInsertsList.join("\n")}`;
console.log(insertText);