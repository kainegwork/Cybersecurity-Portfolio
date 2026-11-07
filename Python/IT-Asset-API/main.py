from fastapi import FastAPI, HTTPException 
from pydantic import BaseModel, Field, field_validator
from typing import Literal

app = FastAPI()
AssetStatus = Literal["Active", "In Storage", "Inactive", "Under Repair", "Retired"]
class Asset(BaseModel):
    id: int = Field(gt=0)
    hostname: str = Field(min_length = 1)
    status: AssetStatus

    @field_validator("hostname", mode="before")
    def validate_hostname(cls, value):
        if isinstance(value,str):
            return value.strip()
        return value

class AssetUpdate(BaseModel):
    status: AssetStatus | None = None

@app.get("/")

def home():
	return{"status": "online", "message": "IT Assest API is running"}
assets = [
	{
		"id": 1,
		"hostname": "LAPTOP-001",
		"status": "Active"
	},
	{
		"id": 2,
		"hostname": "DESKTOP-001",
		"status": "In Storage"
	}
]

@app.get("/assets")

def get_assets():
	return assets

@app.get("/assets/{asset_id}")

def get_asset(asset_id: int):
	for asset in assets:
		if asset["id"] == asset_id:
			return asset

	raise HTTPException(status_code=404, detail="Asset not Found")


@app.post("/assets")

def create_asset(asset: Asset):
	for existing_asset in assets:
		if existing_asset["id"] == asset.id:
			raise HTTPException(status_code=409, detail="Asset ID already exists")

	assets.append(asset.model_dump())
	return asset

@app.patch("/assets/{asset_id}")

def update_asset(asset_id: int, update: AssetUpdate):
    for asset in assets:
        if asset["id"] == asset_id:
            if update.status is not None:
                  asset["status"] = update.status    
            return asset 
    raise HTTPException(status_code=404, detail="Asset not found") 

@app.delete("/assets/{asset_id}")

def delete_asset(asset_id: int):
    for asset in assets:
        if asset["id"] == asset_id:
            assets.remove(asset)
            return {"message": "Asset deleted successfully"}
    raise HTTPException(status_code=404, detail="Asset not found")
