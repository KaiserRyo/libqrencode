/*
 * config.h
 *
 *  Created on: Jun 7, 2010
 *      Author: HLITTLE
 */

#ifndef CONFIG_H_
#define CONFIG_H_

#define MAJOR_VERSION 3
#define MINOR_VERSION 3
#define MICRO_VERSION 1
#define VERSION "MAJOR_VERSION.MINOR_VERSION.MICRO_VERSION"

#if defined(WITH_TESTS)
#   define __STATIC 
#else
#   define __STATIC static
#endif

#endif /* CONFIG_H_ */
