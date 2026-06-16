package com.testkiller.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.Batch;

public interface BatchRepository extends JpaRepository<Batch, Long> {
}
