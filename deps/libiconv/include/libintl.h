/*
Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
*/

#ifndef LIBINTL_HPP_
#define LIBINTL_HPP_

#include <stdio.h>

#define LIBINTL_LITE_API
#if (defined(WIN32) || defined(WINCE)) && defined(LIBINTL_LITE_WIN32_SHARED)
	#undef LIBINTL_LITE_API
	#ifdef LIBINTL_LITE_EXPORTS
		#define LIBINTL_LITE_API __declspec(dllexport)
	#else
		#define LIBINTL_LITE_API __declspec(dllimport)
	#endif
#endif

#ifdef __cplusplus
extern "C"
{
#endif

typedef int libintl_lite_bool_t;
#define LIBINTL_LITE_BOOL_TRUE 1
#define LIBINTL_LITE_BOOL_FALSE 0

/**
 * Loads a message catalog from a given (GNU-compatible) .mo file.
 * Returns true, if the message catalog was loaded successfully and
 * false otherwise.
 * This function is specific to libintl-lite and serves as a simple
 * replacement for bindtextdomain() function of GNU gettext.
 * The parameter "domain" must not be NULL!
 * This function is NOT thread safe!
 * Pay attention to the thread safety remarks of the gettext() function!
 */
LIBINTL_LITE_API libintl_lite_bool_t loadMessageCatalog(const char* domain, const char* moFilePath);
LIBINTL_LITE_API libintl_lite_bool_t loadMessageCatalogFile(const char* domain, FILE* moFile);

LIBINTL_LITE_API libintl_lite_bool_t bindtextdomain(const char* domain, const char* dirname);

LIBINTL_LITE_API libintl_lite_bool_t bind_textdomain_codeset(const char* domain, const char* codeset);

/**
 * Closes a message catalog for the specified domain and releases its obtained resources.
 * This function is NOT thread safe!
 * Pay attention to the thread safety remarks of the gettext() function!
 */
LIBINTL_LITE_API void closeLoadedMessageCatalog(const char* domain);

/**
 * Closes all loaded message catalogs releases their obtained resources.
 * This function is NOT thread safe!
 * Pay attention to the thread safety remarks of the gettext() function!
 */
LIBINTL_LITE_API void closeAllLoadedMessageCatalogs();

/**
 * Sets the default text domain for gettext() / ngettext() calls.
 * This function is NOT thread safe!
 */
LIBINTL_LITE_API const char* textdomain(const char* domain);

/**
 * Returns a pointer to the NULL-terminated string in the loaded for the default
 * message catalog, or origString if origStr is NULL, textdomain() was not called,
 * no message catalog for the specified domain is loaded or no translated message
 * could be found.
 * This function is thread-safe, but loadMessageCatalog(), textdomain(),
 * closeLoadedMessageCatalog() or closeAllLoadedMessageCatalogs()
 * must not be called at the same time! A returned string in the current
 * loaded message catalog will be deleted, if loadMessageCatalog() or
 * closeLoadedMessageCatalog() is called for the used domain afterwards!
 * Does not perform any character set conversion!
 */
LIBINTL_LITE_API const char* gettext(const char* origStr);

/**
 * Works like the gettext() function, but uses the message catalog for a specified domain.
 */
LIBINTL_LITE_API const char* dgettext(const char* domain, const char* origStr);

/**
 * Works like the gettext() function, but distinguishes between singular
 * and plural form of a message.
 * Always returns the suitable singular string, if n == 1, and the plural string
 * otherwise, regardless of the language.
 */
LIBINTL_LITE_API const char* ngettext(const char* origStr, const char* origStrPlural, unsigned long n);

/**
 * Works like the ngettext() function, but uses the message catalog for a specified domain.
 */
LIBINTL_LITE_API const char* g_dngettext(const char* domain, const char* origStr, const char* origStrPlural, unsigned long n);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // LIBINTL_HPP_
