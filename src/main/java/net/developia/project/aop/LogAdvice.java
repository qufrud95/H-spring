
package net.developia.project.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {
	@AfterThrowing(
		pointcut = "execution(* net.developia.project.service.BoardService*.*(..))", 
		throwing = "exception")
	public void logException(Exception exception) throws Exception {
		log.info("❤❤❤ logAdvice.logException 수행중... ❤❤❤");
		log.info(exception.toString());
		throw exception;
	}
	
	
	@Before("execution(* net.developia.project.service.AutocompleteService*.*(..))")
	public void logBefore() {
		log.info("----------------- : logBefore()");
	}
	
	@AfterThrowing(pointcut = "execution(* net.developia.project.service.AutocompleteService*.*(..))",
			throwing = "exception")
	public void logException2(Exception exception) {
		log.info("Exception ~!");
		log.info("exception : " + exception);
	}
	
	@Around("execution(* net.developia.project.service.AutocompleteService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		log.info("Target : " + pjp.getTarget());
		log.info("Param : " + Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		log.info("time : " + ((double)end - start) / 1000 + "sec");
		
		return result;
	}
	
}