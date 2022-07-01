package org.adbs.dbxic.engine.core;

import org.adbs.dbxic.catalog.Attribute;
import org.adbs.dbxic.catalog.Relation;
import org.adbs.dbxic.catalog.Tuple;
import org.adbs.dbxic.catalog.TupleSlotPointer;
import org.adbs.dbxic.engine.algebra.Proposition;
import org.adbs.dbxic.engine.algebra.Variable;
import org.adbs.dbxic.engine.physicalOperators.AtomicCondition;
import org.adbs.dbxic.engine.physicalOperators.MessageThroughPipe;
import org.adbs.dbxic.engine.physicalOperators.Pipe;
import org.adbs.dbxic.utils.DBxicException;
import org.adbs.dbxic.utils.Pair;
import org.adbs.dbxic.utils.TypeCasting;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * TupleModification: To run a tuple modification instruction.
 */
public class TupleModification extends Statement {

    private String tablename;
    private Pair<List<Variable>,List<Comparable>> values;
    private Proposition prop;


    /**
     * Constructor: creates a new tuple modification command given the name of the table where insertion is expected,
     * the new values
     */
    public TupleModification(String tablename, Pair<List<Variable>,List<Comparable>> values, Proposition prop) {
        this.tablename = tablename;
        this.values = values;
        this.prop = prop;
    } // TupleModification()
    
    /**
     * getTableName: returns the name of the table where the tuple is to be modified.
     */
    public String getTableName() {
        return tablename;
    } // getTableName()
    
    /**
     * getValues: returns the values of the new tuple
     */
    public Pair<List<Variable>,List<Comparable>> getValues() {
        return values;
    } // getValues()

    @Override
    public Pipe execute(DBMS engine) throws DBxicException {
        // Look for the tuple
        Relation rel = engine.catalog.getTable(tablename);
        String filename = engine.catalog.getTableFileName(tablename);
        Iterator<Tuple> iterator;
        boolean is_found = false;
        try {
            iterator = engine.storManager.tuples(rel, filename).iterator();
        } catch (IOException e) {
            throw new DBxicException("Error: Couldn't find table " + tablename + ".");
        }
        Pair<Integer, Attribute> lookAtt = rel.getAttributeByName(this.prop.getLeftVariable().getAttribute());
        System.out.println("Set fields: " + this.values.toString());
        TupleSlotPointer tsp = new TupleSlotPointer(null, lookAtt.first, lookAtt.second.getType());

        Comparable c = TypeCasting.createComparable(tsp.getType(), this.prop.getRightValue());
        AtomicCondition ac = new AtomicCondition(tsp, c, this.prop.getRelationship());

        Tuple currTuple = null;
        int pos = 0;

        /////////////////////////////////////////////////////////
        //
        // TODO: TupleModification: YOUR CODE GOES HERE
        // Find for the tuple which matches the condition
        // Make the changes into all the affected attributes and
        // persist the changes
        //
        /////////////////////////////////////////////////////////

        is_found = false;
        // Find the right tuple. Use iterator.
        while (iterator.hasNext() && !is_found) {
            currTuple= iterator.next();
            tsp.setTuple(currTuple);
            System.out.println("Pos: " + pos + " Current tuple: " + currTuple);
            if (ac.evaluate()) {
                // Make the changes (to all the possible modified attrs.).
                // Use rel.getAttributeByName(att_name) to find attribute instance
                System.out.println("Entrou: " + currTuple);
                for (int it=0; it < this.values.first.size(); it++) {
                    Pair<Integer, Attribute> newAttribute = rel.getAttributeByName(this.values.first.get(it).getAttribute());
                    System.out.println(newAttribute.first + " ---- " + this.values.second.get(it).toString());
                    currTuple.setValue(newAttribute.first, this.values.second.get(it));
                }
                // update tuple
                TypeCasting.castValuesToTypesIfNec(currTuple.getValues(), rel.getTypes());

                // store the tuple in the same position where we found it (that is, replace it with the new version)
                // Use storageManager.
                engine.storManager.updateTupleInPosition(rel, filename, currTuple, pos);
                is_found = true;
            }
            pos += 1;
        }

        return new MessageThroughPipe("Tuple was successfully modified into table " + tablename);
    }

    /**
     * help: returns how to ask for the catalog
     */
    public static String help() {
        return " > update <table_name> set <att_1> = value_1, ..., <att_n> = value_n \n" +
                "  where <att_name> = value;\n " +
                "To modify the tuple in the table with name 'table_name' which\n " +
                "has value 'value' for attribute <att_name>. The new values are\n" +
                "as <att_1> = value_1, ..., <att_n> = value_n.\n";
    } // help()
} // TupleInsertion
