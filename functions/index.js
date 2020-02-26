const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

let db = admin.database();

const REF_USUARIOS = "/usuarios/";
const REF_EVENTOS = "/eventos/";

exports.createProfile = functions.auth
    .user()
    .onCreate((userRecord, context) => {
        return db.ref(REF_USUARIOS + userRecord.uid)
            .set({
                nombre: userRecord.displayName || userRecord.email,
            });
    });

exports.deleteProfile = functions.auth
    .user()
    .onDelete((userRecord, context) => {
        return db.ref(REF_USUARIOS + userRecord.uid)
            .delete();
    });

exports.createEvent = functions.database.ref(REF_EVENTOS + "{id}").onCreate((snap, context) => {
    return db.ref(REF_EVENTOS + context.params.id).update({
        creador: context.auth.uid,
    })
});
