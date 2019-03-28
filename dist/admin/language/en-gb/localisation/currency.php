<?php

/* 	Sunrise CMS - Open source CMS for widespread use.
	Copyright (C) 2019 Mykola Burakov (burakov.work@gmail.com)

	See SOURCE.txt for other and additional information.

	This file is part of Sunrise CMS.

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. */

// Heading
$_['heading_title']        = 'Currencies';

// Text
$_['text_success']         = 'Success: You have modified currencies!';
$_['text_list']            = 'Currency List';
$_['text_add']             = 'Add Currency';
$_['text_edit']            = 'Edit Currency';
$_['text_iso']             = 'You can find a full list of ISO currency codes and settings <a href="http://www.xe.com/iso4217.php" target="_blank">here</a>.';

// column
$_['column_title']         = 'Currency Title';
$_['column_code']          = 'Code';
$_['column_value']         = 'Value';
$_['column_date_modified'] = 'Last Updated';
$_['column_action']        = 'Action';

// Entry
$_['entry_title']          = 'Currency Title';
$_['entry_code']           = 'Code';
$_['entry_value']          = 'Value';
$_['entry_symbol_left']    = 'Symbol Left';
$_['entry_symbol_right']   = 'Symbol Right';
$_['entry_decimal_place']  = 'Decimal Places';
$_['entry_status']         = 'Status';

// Help
$_['help_code']            = 'Do not change if this is your default currency.';
$_['help_value']           = 'Set to 1.00000 if this is your default currency.';

// Error
$_['error_permission']     = 'Warning: You do not have permission to modify currencies!';
$_['error_title']          = 'Currency Title must be between 3 and 32 characters!';
$_['error_code']           = 'Currency Code must contain 3 characters!';
$_['error_default']        = 'Warning: This currency cannot be deleted as it is currently assigned as the default store currency!';
$_['error_store']          = 'Warning: This currency cannot be deleted as it is currently assigned to %s stores!';
$_['error_order']          = 'Warning: This currency cannot be deleted as it is currently assigned to %s orders!';