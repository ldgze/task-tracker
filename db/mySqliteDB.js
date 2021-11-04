const sqlite3 = require("sqlite3");
const { open } = require("sqlite");

// async function getReferences(query, page, pageSize) {
//   console.log("getReferences", query);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     SELECT * FROM Reference
//     WHERE title LIKE @query
//     ORDER BY created_on DESC
//     LIMIT @pageSize
//     OFFSET @offset;
//     `);

//   const params = {
//     "@query": query + "%",
//     "@pageSize": pageSize,
//     "@offset": (page - 1) * pageSize,
//   };

//   try {
//     return await stmt.all(params);
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

async function getTasks(query, page, pageSize) {
  console.log("getTasks", query);

  const db = await open({
    filename: "./db/taskDB.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT * FROM Task
    WHERE title LIKE @query
    ORDER BY createDate DESC
    LIMIT @pageSize
    OFFSET @offset;
    `);

  const params = {
    "@query": query + "%",
    "@pageSize": pageSize,
    "@offset": (page - 1) * pageSize,
  };

  try {
    return await stmt.all(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// async function getReferencesCount(query) {
//   console.log("getReferences", query);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     SELECT COUNT(*) AS count
//     FROM Reference
//     WHERE title LIKE @query;
//     `);

//   const params = {
//     "@query": query + "%",
//   };

//   try {
//     return (await stmt.get(params)).count;
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

async function getTasksCount(query) {
  console.log("getTasks", query);

  const db = await open({
    filename: "./db/taskDB.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT COUNT(*) AS count
    FROM Task
    WHERE title LIKE @query;
    `);

  const params = {
    "@query": query + "%",
  };

  try {
    return (await stmt.get(params)).count;
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// async function getReferenceByID(reference_id) {
//   console.log("getReferenceByID", reference_id);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     SELECT * FROM Reference
//     WHERE reference_id = @reference_id;
//     `);

//   const params = {
//     "@reference_id": reference_id,
//   };

//   try {
//     return await stmt.get(params);
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

async function getTaskByID(taskID) {
  console.log("getTaskByID", taskID);

  const db = await open({
    filename: "./db/taskDB.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT * FROM Task
    WHERE taskID = @taskID;
    `);

  const params = {
    "@taskID": taskID,
  };

  try {
    return await stmt.get(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// async function updateReferenceByID(reference_id, ref) {
//   console.log("updateReferenceByID", reference_id, ref);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     UPDATE Reference
//     SET
//       title = @title,
//       published_on = @published_on
//     WHERE
//        reference_id = @reference_id;
//     `);

//   const params = {
//     "@reference_id": reference_id,
//     "@title": ref.title,
//     "@published_on": ref.published_on,
//   };

//   try {
//     return await stmt.run(params);
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

// async function deleteReferenceByID(reference_id) {
//   console.log("deleteReferenceByID", reference_id);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     DELETE FROM Reference
//     WHERE
//        reference_id = @reference_id;
//     `);

//   const params = {
//     "@reference_id": reference_id,
//   };

//   try {
//     return await stmt.run(params);
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

// async function insertReference(ref) {
//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`INSERT INTO
//     Reference(title, published_on)
//     VALUES (@title, @published_on);`);

//   try {
//     return await stmt.run({
//       "@title": ref.title,
//       "@published_on": ref.published_on,
//     });
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

// async function getAuthorsByReferenceID(reference_id) {
//   console.log("getAuthorsByReferenceID", reference_id);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     SELECT * FROM Reference_Author
//     NATURAL JOIN Author
//     WHERE reference_id = @reference_id;
//     `);

//   const params = {
//     "@reference_id": reference_id,
//   };

//   try {
//     return await stmt.all(params);
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

async function getTagsByTaskID(taskID) {
  console.log("getTagsByTaskID", taskID);

  const db = await open({
    filename: "./db/taskDB.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT * FROM Tag
    JOIN Tag_Task
    ON Tag_Task.tagID = Tag.tagID
    JOIN Task
    ON Tag_Task.taskID = Task.taskID
    WHERE Tag_Task.taskID = @taskID;
    `);

  const params = {
    "@taskID": taskID,
  };

  try {
    return await stmt.all(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// async function addAuthorIDToReferenceID(reference_id, author_id) {
//   console.log("addAuthorIDToReferenceID", reference_id, author_id);

//   const db = await open({
//     filename: "./db/database.db",
//     driver: sqlite3.Database,
//   });

//   const stmt = await db.prepare(`
//     INSERT INTO
//     Reference_Author(reference_id, author_id)
//     VALUES (@reference_id, @author_id);
//     `);

//   const params = {
//     "@reference_id": reference_id,
//     "@author_id": author_id,
//   };

//   try {
//     return await stmt.run(params);
//   } finally {
//     await stmt.finalize();
//     db.close();
//   }
// }

async function addTagIDToTaskID(taskID, tagID) {
  console.log("addTagIDToTaskID", taskID, tagID);

  const db = await open({
    filename: "./db/taskDB.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    INSERT INTO
    Tag_Task(taskID, tagID)
    VALUES (@taskID, @tagID);
    `);

  const params = {
    "@taskID": taskID,
    "@tagID": tagID,
  };

  try {
    return await stmt.run(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

async function removeTagIDFromTaskID(taskID, tagID) {
  console.log("removeTagIDFromTaskID", taskID, tagID);

  const db = await open({
    filename: "./db/taskDB.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    DELETE FROM
    Tag_Task
    WHERE taskID=@taskID AND tagID=@tagID;
    `);

  const params = {
    "@taskID": taskID,
    "@tagID": tagID,
  };

  try {
    return await stmt.run(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}
//module.exports.getReferences = getReferences;
module.exports.getTasks = getTasks;
//module.exports.getReferencesCount = getReferencesCount;
module.exports.getTasksCount = getTasksCount;
//module.exports.insertReference = insertReference;
//module.exports.getReferenceByID = getReferenceByID;
module.exports.getTaskByID = getTaskByID;
//module.exports.updateReferenceByID = updateReferenceByID;
//module.exports.deleteReferenceByID = deleteReferenceByID;
//module.exports.getAuthorsByReferenceID = getAuthorsByReferenceID;
module.exports.getTagsByTaskID = getTagsByTaskID;
module.exports.addTagIDToTaskID = addTagIDToTaskID;

module.exports.removeTagIDFromTaskID = removeTagIDFromTaskID;
