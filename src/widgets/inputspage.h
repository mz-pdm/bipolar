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

#ifndef __INPUTS_PAGE__
#define __INPUTS_PAGE__

#include <QWizardPage>

class InputsPage : public QWizardPage {
    Q_OBJECT

public:
    InputsPage(QWidget *parent=0);
    //virtual bool isComplete() const;

};

#endif // __INPUTS_PAGE__
