import express from "express";
import cors from "cors";
import multer from "multer";
import * as ipfsClient from "ipfs-http-client";
import path from "path";
import fs from "fs";

const app = express();
app.use(cors());

app.get("/ping", (_, res) => {
	res.send("healthy");
});

const MAX_SIZE = 52428800;

const storage = multer.diskStorage({
	destination(req, file, cb) {
		cb(
			null,
			path.join("/Users/gauravgupta/source/hedgehog-backend/", "uploads")
		);
	},
	filename(req, file, cb) {
		cb(null, `${Date.now()}.${file.mimetype.split("/")[1]}`);
	},
});

const upload = multer({ storage });
const projectId = ""; // <---------- your Infura Project ID

const projectSecret = ""; // <---------- your Infura Secret
// (for security concerns, consider saving these values in .env files)

const auth =
	"Basic " + Buffer.from(projectId + ":" + projectSecret).toString("base64");

const ipfs = ipfsClient.create({
	host: "ipfs.infura.io",
	port: 5001,
	protocol: "https",
	headers: {
		authorization: auth,
	},
});

app.post("/upload", upload.single("file"), async (req, res) => {
	console.log("filee", req.file);

	if (!req.file) {
		return res.status(422).json({
			error: "File needs to be provided.",
		});
	}

	const mime = req.file.mimetype;
	const data = fs.readFileSync(req.file.path);
	const uploadResult = await ipfs.add(data);
	console.log("uploadResult", uploadResult);
	return res.json({
		hash: uploadResult,
	});
});

app.listen(7000, () => console.log("Server is up and running"));
