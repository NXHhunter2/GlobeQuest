"""Add countries table

Revision ID: 357a5d00e494
Revises: b4a4b102a6dc
Create Date: 2025-03-29 16:10:48.968902

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '357a5d00e494'
down_revision = 'b4a4b102a6dc'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('countries',
    sa.Column('country_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('country_name', sa.String(), nullable=False),
    sa.Column('continent', sa.String(), nullable=False),
    sa.PrimaryKeyConstraint('country_id'),
    sa.UniqueConstraint('country_id'),
    sa.UniqueConstraint('country_name')
    )
    with op.batch_alter_table('scores', schema=None) as batch_op:
        batch_op.add_column(sa.Column('country_id', sa.Integer(), nullable=True))
        batch_op.create_foreign_key(None, 'countries', ['country_id'], ['country_id'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('scores', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.drop_column('country_id')

    op.drop_table('countries')
    # ### end Alembic commands ###
