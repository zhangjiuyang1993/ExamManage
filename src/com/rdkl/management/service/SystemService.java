package com.rdkl.management.service;

import java.util.LinkedHashMap;

import org.springframework.stereotype.Service;

import com.rdkl.common.util.MenuItem;

@Service
public interface SystemService {

	public LinkedHashMap<String,MenuItem> getMenuItemsByAuthority(String authority);
}
