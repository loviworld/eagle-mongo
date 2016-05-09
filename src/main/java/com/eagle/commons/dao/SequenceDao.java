package com.eagle.commons.dao;

import com.eagle.commons.domain.Sequence;
import com.eagle.commons.exception.DataAccessException;

public interface SequenceDao  extends GenericDao<Sequence>{

	int getNextSequenceId(String key) throws DataAccessException;
}
