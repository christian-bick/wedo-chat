db.createUser(
    {
        user: "messaging",
        pwd: "messaging",
        roles: [
            {
                role: "readWrite",
                db: "messaging"
            }
        ]
    }
);