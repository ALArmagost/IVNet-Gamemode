/*
 *	This file is part of IVNet-Gamemode (OSG).
 *
 *  IVNet-Gamemode (OSG) is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  IVNet-Gamemode (OSG) is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.

 *  You should have received a copy of the GNU General Public License
 *  along with IVNet-Gamemode (OSG).  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  @file: CVehicle.nut
 *	@desc: Contains our modified CVehicleEntity
 *	@init-author: Jan Christophersen
 *	@date: 11.11.2013
 */

class 
	CVehicleEntity extends CVehicleEntity
{
	/* WARNING
	 * This class can break things easily since we are modifying
	 * the class that the server uses.
	 */

	m_bFactionCar		=	false;
	m_ciOwner			=	null;
	m_fMaxHealth		=	1000.0;
	m_tOccupands		=	null;

	function constructor ()
	{
		base.constructor();


		m_bFactionCar	=	false;
		m_ciOwner		=	null;
		m_fMaxHealth	=	1000.0;
		m_tOccupands	=	{};

		debug("Vehicle constructed.");
		return true;
	}

	function SetOwner (ciOwner)
	{
		if (ciOwner instanceof CFaction)
		{
			/*	TODO:
			 *	-Set Carhealth for faction
			 *	-Eject player that is not allowed to drive it
			 */
			m_bFactionCar = true;
		}
		else if (ciOwner instanceof CPlayer)
		{
			m_bFactionCar = false;
		}
		else if (ciOwner == null)
		{
			// Public car
			
			m_bFactionCar = false;
		}
		else
		{
			log("SetOwner for Vehicle " + this.getId() + " failed.", LOG_ERROR);
			return false;
		}

		m_ciOwner = ciOwner;
		return true;
	}
}