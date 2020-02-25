const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

let db = admin.firestore();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

exports.createProfile = functions.auth
    .user()
    .onCreate((userRecord, context) => {
        return db.collection("usuaros").doc(userRecord.uid)
            .set({
                nombre: userRecord.displayName || userRecord.email,
            });
    });

exports.deleteProfile = functions.auth
    .user()
    .onDelete((userRecord, context) => {
        return db.collection("usuaros").doc(userRecord.uid)
            .delete();
    });

exports.createEvent = functions.firestore.document("eventos/{id}").onCreate((userRecord, eventContext) => {
    return db.collection("eventos").doc(eventContext.params.id).update({
        creador: db.collection("usuarios").doc(userRecord.data.uid),
    })
});
