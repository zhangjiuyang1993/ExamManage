package com.rdkl.management.persistence;

import java.util.List;

import com.rdkl.common.util.MenuItem;


public interface SystemMapper {

	public List<MenuItem> getMenuItemsByAuthority(String authority);
}
