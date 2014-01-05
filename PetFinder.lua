PetFinder_Families = {
	'Humanoid',
	'Dragon', --'Dragonkin',
	'Flying',
	'Undead',
	'Critter',
	'Magical', --'Magic',
	'Elemental',
	'Beast',
	'Water', --'Aquatic',
	'Mechanical'
};




function PetFinderOnLoad(frame) 
	print("PetFinder loading!"); 

	-- http://wowpedia.org/API_CreateFrame
	local button = CreateFrame('Button', 'Button_Human', frame);
	print(button:IsVisible())

	--print(frame:GetName());
	
		
	print("PetFinder loaded!"); 
end

function PetFinderDrag()
	PetFinderFrame:StartMoving();
end

function PetFinderDragStop()
	PetFinderFrame:StopMovingOrSizing();
end


function PetFinderButtonOnClick(familyName)
	print('Clicked ' .. familyName);
	FilterPets(familyName);
end

-- filter http://wowpedia.org/API_C_PetJournal.SetPetTypeFilter

function FilterPets(familyName) 
	local familyId = LookupPetFamily(familyName);
	C_PetJournal.SetPetTypeFilter(familyId, C_PetJournal.IsPetTypeFiltered(familyId));
end



function LookupPetFamily(familyName)
	for i,v in pairs(PetFinder_Families) do
		if (v == familyName) then
			return i;
		end
	end

	if (familyName == 'Humanoid') then
		return 1;
	elseif(familyName == 'Critter') then
		return 5;
	else
		-- invalid family
	end
	return -1;
end



function OnClickTest(self)

end
