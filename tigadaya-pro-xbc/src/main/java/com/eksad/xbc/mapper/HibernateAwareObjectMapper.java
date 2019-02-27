package com.eksad.xbc.mapper;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module.Feature;
public class HibernateAwareObjectMapper extends ObjectMapper {
	public HibernateAwareObjectMapper() {
        // This for Hibernate 5; change 5 to 4 or 3 if you need to support
        // Hibernate 4 or Hibernate 3 instead
    	Hibernate5Module hbm = new Hibernate5Module();
    	hbm.enable(Feature.FORCE_LAZY_LOADING);
    	hbm.enable(Feature.REPLACE_PERSISTENT_COLLECTIONS);
    	hbm.enable(Feature.SERIALIZE_IDENTIFIER_FOR_LAZY_NOT_LOADED_OBJECTS);
        registerModule(hbm);
    }
}
