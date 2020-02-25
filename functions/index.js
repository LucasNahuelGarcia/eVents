const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

let db = admin.database();

exports.createProfile = functions.auth
    .user()
    .onCreate((userRecord, context) => {
        return db.ref("/usuaros/" + userRecord.uid)
            .set({
                nombre: userRecord.displayName || userRecord.email,
            });
    });

exports.deleteProfile = functions.auth
    .user()
    .onDelete((userRecord, context) => {
        return db.ref("/usuaros/" + userRecord.uid)
            .delete();
    });

exports.createEvent = functions.database.ref("eventos/{id}").onCreate((snap, context) => {
    return db.collection("eventos").doc(eventContext.params.id).update({
        creador: db.collection("usuarios").doc(context.auth),
    })
});
