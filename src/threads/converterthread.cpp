/*
    Copyright 2014 Paul Colby

    This file is part of Bipolar.

    Bipolar is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Biplar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Bipolar.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "converterthread.h"

ConverterThread::ConverterThread(QObject * const parent)
    : QThread(parent), cancelled(false)
{

}

bool ConverterThread::isCancelled() const
{
    return cancelled;
}

// Public slots.

void ConverterThread::cancel()
{
    cancelled = true;
}

// Protoected methods.

void ConverterThread::run()
{
    // Just a dummy placeholder for now.
    for (int i = 1; (i <= 20) && (!cancelled); ++i) {
        emit progress(i);
        QThread::sleep(1);
    }
}
