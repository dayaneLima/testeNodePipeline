import app from "./app";


/**
 * App Variables
 */

if (!process.env.PORT) {
    process.exit(1);
}
 
const PORT: number = parseInt(process.env.PORT as string, 10);
/**
 * Server Activation
 */

// app.listen(PORT, () => {
//     console.log(`Listening on port ${PORT}`);
// });

// const httpServer = http.createServer(router);
// httpServer.listen(PORT, () => console.log(`The server is running on port ${PORT}`));

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});