package com.curso.KarateCurso;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(features = "classpath:com/curso/KarateCurso/00countries.feature")
public class KarateOptionsRunner {
	
}
