execute_process(COMMAND ${SIM} ${HELLO}
   OUTPUT_FILE output RESULT_VARIABLE RESULT)
if (RESULT)
  message(FATAL_ERROR "Error running simulated test.")
endif()
execute_process(
  COMMAND ${CMAKE_COMMAND} -E compare_files --ignore-eol output ${EXPECTED}
   RESULT_VARIABLE RESULT)
if (RESULT)
  message(FATAL_ERROR "Incorrect output.")
endif()
