db.users.insertMany([
  {
    email: "admin@workspace.dev",
    passwordHash: "demo-hash",
    role: "ADMIN"
    },
    {
        email: "member@workspace.dev",
        passwordHash: "demo-hash",
        role: "MEMBER"
    }
]);

const p1 = ObjectId();
const p2 = ObjectId();

db.projects.insertMany([
    {
        _id: p1,
        name: "Website Redesign",
        description: "Revamp the client portal UI.",
        memberIds: []
    },
    {
        _id: p2,
        name: "Mobile Sprint",
        description: "Build the first release of the mobile app.",
        memberIds: []
    }
]);

db.tasks.insertMany([
    {
        projectId: p1,
        title: "Create wireframes",
        description: "Draft the new dashboard layout.",
        status: "BACKLOG",
        tags: ["design"],
        createdAt: new Date()
    },
    {
        projectId: p1,
        title: "Implement login flow",
        description: "Add auth screens and API integration.",
        status: "IN_PROGRESS",
        tags: ["frontend", "auth"],
        createdAt: new Date()
    },
    {
        projectId: p2,
        title: "Set up project structure",
        description: "Initialize Flutter modules and services.",
        status: "COMPLETED",
        tags: ["flutter", "setup"],
        createdAt: new Date()
    }
]);