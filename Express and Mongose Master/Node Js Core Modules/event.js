

const EventEmitter = require("node:events");
console.log(EventEmitter);

const emitter = new EventEmitter();

emitter.on("event-1", (data) => console.log("Event 1 triggered with data:", data));
emitter.on("event-2", (data) => console.log("Event 2 triggered with data:", data)); 


emitter.emit("event-1", "Hello World from event 1");
emitter.emit("event-2", "Hello World from event 2");

// Example of using process.argv to get command line arguments
const text = process.argv.slice(2).join(" ");
console.log("Text from command line arguments:", text);